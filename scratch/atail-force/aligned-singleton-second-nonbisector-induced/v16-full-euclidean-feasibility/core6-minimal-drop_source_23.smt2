; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun x_3 () Real)
(declare-fun y_3 () Real)
(declare-fun x_2 () Real)
(declare-fun y_1 () Real)
(declare-fun y_2 () Real)
(declare-fun x_1 () Real)
(declare-fun x_4 () Real)
(declare-fun y_4 () Real)
(declare-fun x_5 () Real)
(declare-fun y_5 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= x_3 1.0))
(assert
 (= y_3 0.0))
(assert
 (let ((?x29 (- (* (- x_1 x_0) (- y_2 y_0)) (* (- y_1 y_0) (- x_2 x_0)))))
 (> ?x29 0.0)))
(assert
 (let ((?x35 (- (* (- x_1 x_0) (- y_3 y_0)) (* (- y_1 y_0) (- x_3 x_0)))))
 (> ?x35 0.0)))
(assert
 (let ((?x41 (- (* (- x_1 x_0) (- y_4 y_0)) (* (- y_1 y_0) (- x_4 x_0)))))
 (> ?x41 0.0)))
(assert
 (let ((?x47 (- (* (- x_1 x_0) (- y_5 y_0)) (* (- y_1 y_0) (- x_5 x_0)))))
 (> ?x47 0.0)))
(assert
 (let ((?x55 (- (* (- x_2 x_1) (- y_0 y_1)) (* (- y_2 y_1) (- x_0 x_1)))))
 (> ?x55 0.0)))
(assert
 (let ((?x61 (- (* (- x_2 x_1) (- y_3 y_1)) (* (- y_2 y_1) (- x_3 x_1)))))
 (> ?x61 0.0)))
(assert
 (let ((?x67 (- (* (- x_2 x_1) (- y_4 y_1)) (* (- y_2 y_1) (- x_4 x_1)))))
 (> ?x67 0.0)))
(assert
 (let ((?x73 (- (* (- x_2 x_1) (- y_5 y_1)) (* (- y_2 y_1) (- x_5 x_1)))))
 (> ?x73 0.0)))
(assert
 (let ((?x81 (- (* (- x_3 x_2) (- y_0 y_2)) (* (- y_3 y_2) (- x_0 x_2)))))
 (> ?x81 0.0)))
(assert
 (let ((?x87 (- (* (- x_3 x_2) (- y_1 y_2)) (* (- y_3 y_2) (- x_1 x_2)))))
 (> ?x87 0.0)))
(assert
 (let ((?x93 (- (* (- x_3 x_2) (- y_4 y_2)) (* (- y_3 y_2) (- x_4 x_2)))))
 (> ?x93 0.0)))
(assert
 (let ((?x99 (- (* (- x_3 x_2) (- y_5 y_2)) (* (- y_3 y_2) (- x_5 x_2)))))
 (> ?x99 0.0)))
(assert
 (let ((?x107 (- (* (- x_4 x_3) (- y_0 y_3)) (* (- y_4 y_3) (- x_0 x_3)))))
 (> ?x107 0.0)))
(assert
 (let ((?x113 (- (* (- x_4 x_3) (- y_1 y_3)) (* (- y_4 y_3) (- x_1 x_3)))))
 (> ?x113 0.0)))
(assert
 (let ((?x119 (- (* (- x_4 x_3) (- y_2 y_3)) (* (- y_4 y_3) (- x_2 x_3)))))
 (> ?x119 0.0)))
(assert
 (let ((?x125 (- (* (- x_4 x_3) (- y_5 y_3)) (* (- y_4 y_3) (- x_5 x_3)))))
 (> ?x125 0.0)))
(assert
 (let ((?x133 (- (* (- x_5 x_4) (- y_0 y_4)) (* (- y_5 y_4) (- x_0 x_4)))))
 (> ?x133 0.0)))
(assert
 (let ((?x139 (- (* (- x_5 x_4) (- y_1 y_4)) (* (- y_5 y_4) (- x_1 x_4)))))
 (> ?x139 0.0)))
(assert
 (let ((?x145 (- (* (- x_5 x_4) (- y_2 y_4)) (* (- y_5 y_4) (- x_2 x_4)))))
 (> ?x145 0.0)))
(assert
 (let ((?x151 (- (* (- x_5 x_4) (- y_3 y_4)) (* (- y_5 y_4) (- x_3 x_4)))))
 (> ?x151 0.0)))
(assert
 (let ((?x159 (- (* (- x_0 x_5) (- y_1 y_5)) (* (- y_0 y_5) (- x_1 x_5)))))
 (> ?x159 0.0)))
(assert
 (let ((?x165 (- (* (- x_0 x_5) (- y_2 y_5)) (* (- y_0 y_5) (- x_2 x_5)))))
 (> ?x165 0.0)))
(assert
 (let ((?x171 (- (* (- x_0 x_5) (- y_3 y_5)) (* (- y_0 y_5) (- x_3 x_5)))))
 (> ?x171 0.0)))
(assert
 (let ((?x177 (- (* (- x_0 x_5) (- y_4 y_5)) (* (- y_0 y_5) (- x_4 x_5)))))
 (> ?x177 0.0)))
(assert
 (let ((?x184 (+ (* (- x_0 x_5) (- x_0 x_5)) (* (- y_0 y_5) (- y_0 y_5)))))
 (let ((?x181 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (= ?x181 ?x184))))
(assert
 (let ((?x191 (+ (* (- x_0 x_4) (- x_0 x_4)) (* (- y_0 y_4) (- y_0 y_4)))))
 (let ((?x188 (+ (* (- x_0 x_2) (- x_0 x_2)) (* (- y_0 y_2) (- y_0 y_2)))))
 (= ?x188 ?x191))))
(assert
 (let ((?x198 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
 (let ((?x195 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x195 ?x198))))
(assert
 (let ((?x209 (+ (* (- x_4 x_5) (- x_4 x_5)) (* (- y_4 y_5) (- y_4 y_5)))))
(let ((?x206 (+ (* (- x_1 x_4) (- x_1 x_4)) (* (- y_1 y_4) (- y_1 y_4)))))
(= ?x206 ?x209))))
(check-sat)
