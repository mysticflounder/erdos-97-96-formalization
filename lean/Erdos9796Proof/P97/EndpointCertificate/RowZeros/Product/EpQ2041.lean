/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2041
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block00_0000_0026
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block01_0100_0113
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block02_0700_0788
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block04_0600_0698
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block05_1000_1001
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block08_0100_0169
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block09_0300_0319
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block11_0600_0660
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block12_0000_0040
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block13_0600_0628
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block14_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block14_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block14_0200_0277
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block15_0600_0690
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block16_0600_0627
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block17_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block17_0300_0383
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1300_1399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1400_1499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1500_1599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1600_1699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1700_1799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1800_1899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_1900_1999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2000_2099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2100_2199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2200_2299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2300_2399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2400_2499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block18_2500_2594
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block19_0700_0780
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block20_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block20_0300_0395
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block21_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block21_0100_0131
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block22_0900_0963
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block23_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block23_0300_0375
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block24_0500_0507
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block25_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block25_0200_0219
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block26_1000_1030
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block27_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block27_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block27_0200_0249
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block28_0900_0982
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block29_1000_1003
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ2041BlockZeros.EpQ2041Block30_0000_0011

/-!
# Endpoint product row-zero certificate ep_Q2_041

This generated module proves that every checked block in product-sum endpoint
row `ep_Q2_041` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q2_041.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q2_041` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_041_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ2.get (Fin.mk 41 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q2_041_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ2041TermShards.ep_Q2_041_block_00_0000_0026,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_01_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_01_0100_0113,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_02_0700_0788,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_04_0600_0698,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_0900_0999,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_05_1000_1001,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_08_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_08_0100_0169,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_09_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_09_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_09_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_09_0300_0319,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_11_0600_0660,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_12_0000_0040,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_13_0600_0628,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_14_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_14_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_14_0200_0277,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_15_0600_0690,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_16_0600_0627,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_17_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_17_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_17_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_17_0300_0383,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_0900_0999,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1000_1099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1100_1199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1200_1299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1300_1399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1400_1499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1500_1599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1600_1699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1700_1799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1800_1899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_1900_1999,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2000_2099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2100_2199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2200_2299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2300_2399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2400_2499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_18_2500_2594,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_19_0700_0780,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_20_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_20_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_20_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_20_0300_0395,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_21_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_21_0100_0131,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_22_0900_0963,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_23_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_23_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_23_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_23_0300_0375,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_24_0500_0507,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_25_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_25_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_25_0200_0219,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_0900_0999,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_26_1000_1030,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_27_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_27_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_27_0200_0249,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_28_0900_0982,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0000_0099,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0100_0199,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0200_0299,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0300_0399,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0400_0499,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0500_0599,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0600_0699,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0700_0799,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0800_0899,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_0900_0999,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_29_1000_1003,
      Patterns.EpQ2041TermShards.ep_Q2_041_block_30_0000_0011
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_00_0000_0026_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_01_0100_0113_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_02_0700_0788_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_04_0600_0698_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_05_1000_1001_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_08_0100_0169_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_09_0300_0319_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_11_0600_0660_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_12_0000_0040_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_13_0600_0628_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_14_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_14_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_14_0200_0277_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_15_0600_0690_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_16_0600_0627_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_17_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_17_0300_0383_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1300_1399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1400_1499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1500_1599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1600_1699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1700_1799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1800_1899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_1900_1999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2000_2099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2100_2199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2200_2299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2300_2399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2400_2499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_18_2500_2594_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_19_0700_0780_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_20_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_20_0300_0395_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_21_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_21_0100_0131_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_22_0900_0963_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_23_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_23_0300_0375_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_24_0500_0507_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_25_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_25_0200_0219_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_26_1000_1030_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_27_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_27_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_27_0200_0249_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_28_0900_0982_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_29_1000_1003_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ2041BlockZeros.ep_Q2_041_block_30_0000_0011_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
