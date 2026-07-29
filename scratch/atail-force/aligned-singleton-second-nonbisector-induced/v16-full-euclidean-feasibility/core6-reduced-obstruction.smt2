; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_5 () Real)
(declare-fun y_5 () Real)
(declare-fun x_10 () Real)
(declare-fun y_10 () Real)
(declare-fun x_9 () Real)
(declare-fun y_7 () Real)
(declare-fun y_9 () Real)
(declare-fun x_7 () Real)
(declare-fun x_11 () Real)
(declare-fun y_11 () Real)
(declare-fun x_12 () Real)
(declare-fun y_12 () Real)
(assert
 (= x_5 0.0))
(assert
 (= y_5 0.0))
(assert
 (= x_10 1.0))
(assert
 (= y_10 0.0))
(assert
 (let ((?x29 (- (* (- x_7 x_5) (- y_9 y_5)) (* (- y_7 y_5) (- x_9 x_5)))))
 (> ?x29 0.0)))
(assert
 (let ((?x35 (- (* (- x_7 x_5) (- y_11 y_5)) (* (- y_7 y_5) (- x_11 x_5)))))
 (> ?x35 0.0)))
(assert
 (let ((?x41 (- (* (- x_7 x_5) (- y_12 y_5)) (* (- y_7 y_5) (- x_12 x_5)))))
 (> ?x41 0.0)))
(assert
 (let ((?x45 (- (* (- x_9 x_5) (- y_11 y_5)) (* (- y_9 y_5) (- x_11 x_5)))))
 (> ?x45 0.0)))
(assert
 (let ((?x53 (- (* (- x_10 x_9) (- y_11 y_9)) (* (- y_10 y_9) (- x_11 x_9)))))
 (> ?x53 0.0)))
(assert
 (let ((?x64 (+ (* (- x_5 x_12) (- x_5 x_12)) (* (- y_5 y_12) (- y_5 y_12)))))
 (let ((?x59 (+ (* (- x_5 x_7) (- x_5 x_7)) (* (- y_5 y_7) (- y_5 y_7)))))
 (= ?x59 ?x64))))
(assert
 (let ((?x75 (+ (* (- x_5 x_11) (- x_5 x_11)) (* (- y_5 y_11) (- y_5 y_11)))))
 (let ((?x70 (+ (* (- x_5 x_9) (- x_5 x_9)) (* (- y_5 y_9) (- y_5 y_9)))))
 (= ?x70 ?x75))))
(assert
 (let ((?x86 (+ (* (- x_9 x_10) (- x_9 x_10)) (* (- y_9 y_10) (- y_9 y_10)))))
 (let ((?x81 (+ (* (- x_5 x_10) (- x_5 x_10)) (* (- y_5 y_10) (- y_5 y_10)))))
 (= ?x81 ?x86))))
(assert
 (let ((?x92 (+ (* (- x_10 x_11) (- x_10 x_11)) (* (- y_10 y_11) (- y_10 y_11)))))
 (let ((?x81 (+ (* (- x_5 x_10) (- x_5 x_10)) (* (- y_5 y_10) (- y_5 y_10)))))
 (= ?x81 ?x92))))
(assert
 (let ((?x103 (+ (* (- x_11 x_12) (- x_11 x_12)) (* (- y_11 y_12) (- y_11 y_12)))))
 (let ((?x98 (+ (* (- x_7 x_11) (- x_7 x_11)) (* (- y_7 y_11) (- y_7 y_11)))))
 (= ?x98 ?x103))))
(assert
 (let ((?x92 (+ (* (- x_10 x_11) (- x_10 x_11)) (* (- y_10 y_11) (- y_10 y_11)))))
(let ((?x86 (+ (* (- x_9 x_10) (- x_9 x_10)) (* (- y_9 y_10) (- y_9 y_10)))))
(= ?x86 ?x92))))
(check-sat)
