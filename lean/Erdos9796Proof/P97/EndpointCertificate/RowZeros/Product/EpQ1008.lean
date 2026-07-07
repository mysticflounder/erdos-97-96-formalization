/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1008
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block00_0500_0515
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block01_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block01_0100_0156
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block02_0900_0914
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block03_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block03_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block03_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block03_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block03_0400_0402
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block04_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block04_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block04_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block04_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block04_0400_0496
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block05_0800_0871
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block06_1000_1004
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block08_0700_0703
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_0900_0999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1000_1099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1100_1199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1200_1299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1300_1399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1400_1499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1500_1599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1600_1699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1700_1799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1800_1899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_1900_1999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2000_2099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2100_2199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2200_2299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2300_2399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2400_2499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2500_2599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2600_2699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2700_2799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2800_2899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_2900_2999
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_3000_3099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_3100_3199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_3200_3299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_3300_3399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block09_3400_3420
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block10_0600_0610
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block11_0900_0958
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block12_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block12_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block12_0200_0206
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block13_0000_0082
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block14_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block14_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block14_0200_0244
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block15_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block15_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block15_0200_0201
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block16_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block16_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block16_0200_0272
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block17_0800_0822
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block18_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block18_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block18_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block18_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block18_0400_0492
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block19_0000_0098
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block20_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block20_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block20_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block20_0300_0311
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block22_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block22_0100_0129
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block23_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block23_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block23_0200_0289
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0700_0799
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0800_0899
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block24_0900_0997
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block25_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block25_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block25_0200_0256
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block26_0600_0697
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0400_0499
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0500_0599
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0600_0699
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block28_0700_0794
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block29_0000_0099
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block29_0100_0199
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block29_0200_0299
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block29_0300_0399
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block29_0400_0474
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.EpQ1008BlockZeros.EpQ1008Block30_0000_0000

/-!
# Endpoint product row-zero certificate ep_Q1_008

This generated module proves that every checked block in product-sum endpoint
row `ep_Q1_008` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

Source certificate: `certificates/endpoint/ep_Q1_008.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Every block in product-sum endpoint certificate `ep_Q1_008` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q1_008_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf (ShadowBank.endpointRowsQ1.get (Fin.mk 8 (by decide))).toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q1_008_blocks)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_00_0500_0515,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_01_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_01_0100_0156,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0800_0899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_02_0900_0914,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_03_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_03_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_03_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_03_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_03_0400_0402,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_04_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_04_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_04_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_04_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_04_0400_0496,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_05_0800_0871,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0800_0899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_0900_0999,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_06_1000_1004,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_08_0700_0703,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0800_0899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_0900_0999,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1000_1099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1100_1199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1200_1299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1300_1399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1400_1499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1500_1599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1600_1699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1700_1799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1800_1899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_1900_1999,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2000_2099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2100_2199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2200_2299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2300_2399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2400_2499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2500_2599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2600_2699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2700_2799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2800_2899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_2900_2999,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_3000_3099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_3100_3199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_3200_3299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_3300_3399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_09_3400_3420,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_10_0600_0610,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0800_0899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_11_0900_0958,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_12_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_12_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_12_0200_0206,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_13_0000_0082,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_14_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_14_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_14_0200_0244,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_15_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_15_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_15_0200_0201,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_16_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_16_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_16_0200_0272,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_17_0800_0822,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_18_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_18_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_18_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_18_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_18_0400_0492,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_19_0000_0098,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_20_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_20_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_20_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_20_0300_0311,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_22_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_22_0100_0129,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_23_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_23_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_23_0200_0289,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0700_0799,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0800_0899,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_24_0900_0997,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_25_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_25_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_25_0200_0256,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_26_0600_0697,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0400_0499,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0500_0599,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0600_0699,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_28_0700_0794,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_29_0000_0099,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_29_0100_0199,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_29_0200_0299,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_29_0300_0399,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_29_0400_0474,
      Patterns.EpQ1008TermShards.ep_Q1_008_block_30_0000_0000
    ] at hp
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_00_0500_0515_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_01_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_01_0100_0156_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_02_0900_0914_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_03_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_03_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_03_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_03_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_03_0400_0402_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_04_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_04_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_04_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_04_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_04_0400_0496_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_05_0800_0871_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_06_1000_1004_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_08_0700_0703_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_0900_0999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1000_1099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1100_1199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1200_1299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1300_1399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1400_1499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1500_1599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1600_1699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1700_1799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1800_1899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_1900_1999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2000_2099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2100_2199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2200_2299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2300_2399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2400_2499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2500_2599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2600_2699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2700_2799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2800_2899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_2900_2999_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_3000_3099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_3100_3199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_3200_3299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_3300_3399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_09_3400_3420_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_10_0600_0610_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_11_0900_0958_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_12_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_12_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_12_0200_0206_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_13_0000_0082_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_14_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_14_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_14_0200_0244_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_15_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_15_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_15_0200_0201_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_16_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_16_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_16_0200_0272_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_17_0800_0822_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_18_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_18_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_18_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_18_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_18_0400_0492_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_19_0000_0098_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_20_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_20_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_20_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_20_0300_0311_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_22_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_22_0100_0129_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_23_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_23_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_23_0200_0289_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0700_0799_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0800_0899_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_24_0900_0997_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_25_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_25_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_25_0200_0256_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_26_0600_0697_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0400_0499_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0500_0599_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0600_0699_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_28_0700_0794_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_29_0000_0099_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_29_0100_0199_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_29_0200_0299_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_29_0300_0399_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_29_0400_0474_eval_zero hmetric
  rcases List.mem_cons.mp hp with rfl | hp
  · exact EpQ1008BlockZeros.ep_Q1_008_block_30_0000_0000_eval_zero hmetric
  cases hp

end Variables

end EndpointCertificate

end Problem97
