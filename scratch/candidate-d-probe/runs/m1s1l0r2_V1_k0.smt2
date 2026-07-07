(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(declare-fun b2y () Real)
(declare-fun b2x () Real)
(assert
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x131 (* (- 1.0) R2)))
 (let ((?x324 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x131)))
 (= (+ (+ ?x324 ?x937) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x670 (* (- 1.0) rho2)))
 (let ((?x823 (* xy xy)))
 (let ((?x321 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x823) ?x670)))
 (= (+ (+ ?x321 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x670 (* (- 1.0) rho2)))
 (let ((?x391 (* y1y y1y)))
 (let ((?x178 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x391) ?x670)))
 (= (+ (+ ?x178 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x670 (* (- 1.0) rho2)))
 (let ((?x823 (* xy xy)))
 (let ((?x253 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x823) ?x670)))
 (= (+ (+ ?x253 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x670 (* (- 1.0) rho2)))
 (let ((?x823 (* xy xy)))
 (let ((?x297 (+ (+ (+ (+ (* b2x b2x) (* b2y b2y)) (* xx xx)) ?x823) ?x670)))
 (= (+ (+ ?x297 (* (* (- 2.0) b2x) xx)) (* (* (- 2.0) b2y) xy)) 0.0)))))
(assert
 (let ((?x374 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x374 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x487 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x487 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x376 (* oy oy)))
 (let ((?x301 (* (- 1.0) ?x376)))
 (let ((?x352 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x352 ?x301) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (let ((?x376 (* oy oy)))
 (let ((?x301 (* (- 1.0) ?x376)))
 (let ((?x489 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b2x) (* (- 1.0) (* b2x b2x))) (* (- 1.0) (* b2y b2y)))))
 (>= (+ (+ ?x489 ?x301) (* (* 2.0 b2y) oy)) 0.0)))))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rho2 0.0))
(assert
 (let ((?x470 (* (- 1.0) v1y)))
 (let ((?x166 (* ?x470 xy)))
 (> ?x166 0.0))))
(assert
 (let ((?x990 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x990 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x470 (* (- 1.0) v1y)))
 (let ((?x357 (* ?x470 y1y)))
 (> ?x357 0.0))))
(assert
 (let ((?x473 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x473 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x110 (* b1y v1x)))
 (let ((?x11 (* ?x110 v1y)))
 (let ((?x125 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x125 ?x11) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (* b2y v1y) 0.0))
(assert
 (let ((?x263 (* b2y v1x)))
 (let ((?x407 (* ?x263 v1y)))
 (let ((?x438 (+ (+ (* v1y v1y) (* (* (- 1.0) b2x) (* v1y v1y))) (* (* (- 1.0) b2y) v1y))))
 (> (+ ?x438 ?x407) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b2x) (* v1y v1y)) (* (* b2y v1x) v1y)) 0.0))
(assert
 (> (+ (* xx y1y) (* (* (- 1.0) xy) y1x)) 0.0))
(assert
 (let ((?x340 (* (- 1.0) xy)))
 (> ?x340 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> (+ (* b2y xx) (* (* (- 1.0) b2x) xy)) 0.0))
(assert
 (let ((?x333 (* (- 1.0) y1y)))
 (> ?x333 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* b2y y1x) (* (* (- 1.0) b2x) y1y)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> b2y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (> (+ (* b2y v1x) (* (* (- 1.0) b2x) v1y)) 0.0))
(assert
 (> (+ (* b1x b2y) (* (* (- 1.0) b1y) b2x)) 0.0))
(assert
 (let ((?x340 (* (- 1.0) xy)))
 (let ((?x20 (* ?x340 y1x)))
 (> (+ (+ (+ xy (* (- 1.0) y1y)) (* xx y1y)) ?x20) 0.0))))
(assert
 (let ((?x340 (* (- 1.0) xy)))
 (let ((?x20 (* ?x340 y1x)))
 (let ((?x470 (* (- 1.0) v1y)))
 (let ((?x45 (* ?x470 xx)))
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x401 (* ?x937 y1y)))
 (let ((?x194 (+ (+ (+ (+ (* v1x xy) (* v1y y1x)) (* xx y1y)) ?x401) ?x45)))
 (> (+ ?x194 ?x20) 0.0)))))))))
(assert
 (let ((?x340 (* (- 1.0) xy)))
 (let ((?x20 (* ?x340 y1x)))
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x399 (* ?x461 xx)))
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x223 (* ?x478 y1y)))
 (let ((?x192 (+ (+ (+ (+ (* b1x xy) (* b1y y1x)) (* xx y1y)) ?x223) ?x399)))
 (> (+ ?x192 ?x20) 0.0)))))))))
(assert
 (let ((?x340 (* (- 1.0) xy)))
 (let ((?x20 (* ?x340 y1x)))
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x202 (* ?x246 xx)))
 (let ((?x68 (* (- 1.0) b2x)))
 (let ((?x162 (* ?x68 y1y)))
 (let ((?x92 (+ (+ (+ (+ (* b2x xy) (* b2y y1x)) (* xx y1y)) ?x162) ?x202)))
 (> (+ ?x92 ?x20) 0.0)))))))))
(assert
 (let ((?x470 (* (- 1.0) v1y)))
 (let ((?x45 (* ?x470 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x45) 0.0))))
(assert
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x399 (* ?x461 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x399) 0.0))))
(assert
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x202 (* ?x246 xx)))
 (> (+ (+ (+ b2y (* (- 1.0) xy)) (* b2x xy)) ?x202) 0.0))))
(assert
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x16 (* ?x937 xy)))
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x399 (* ?x461 xx)))
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x242 (* ?x478 v1y)))
 (let ((?x360 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x242) ?x399)))
 (> (+ ?x360 ?x16) 0.0)))))))))
(assert
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x16 (* ?x937 xy)))
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x202 (* ?x246 xx)))
 (let ((?x68 (* (- 1.0) b2x)))
 (let ((?x973 (* ?x68 v1y)))
 (let ((?x448 (+ (+ (+ (+ (* b2x xy) (* b2y v1x)) (* v1y xx)) ?x973) ?x202)))
 (> (+ ?x448 ?x16) 0.0)))))))))
(assert
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x202 (* ?x246 xx)))
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x701 (* ?x461 b2x)))
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x79 (* ?x478 xy)))
 (let ((?x413 (+ (+ (+ (+ (* b1x b2y) (* b1y xx)) (* b2x xy)) ?x79) ?x701)))
 (> (+ ?x413 ?x202) 0.0)))))))))
(assert
 (let ((?x155 (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) (* (* (- 1.0) v1y) y1x))))
 (> ?x155 0.0)))
(assert
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x65 (* ?x461 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x65) 0.0))))
(assert
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x398 (* ?x246 y1x)))
 (> (+ (+ (+ b2y (* (- 1.0) y1y)) (* b2x y1y)) ?x398) 0.0))))
(assert
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x401 (* ?x937 y1y)))
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x65 (* ?x461 y1x)))
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x242 (* ?x478 v1y)))
 (let ((?x27 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x242) ?x65)))
 (> (+ ?x27 ?x401) 0.0)))))))))
(assert
 (let ((?x937 (* (- 1.0) v1x)))
 (let ((?x401 (* ?x937 y1y)))
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x398 (* ?x246 y1x)))
 (let ((?x68 (* (- 1.0) b2x)))
 (let ((?x973 (* ?x68 v1y)))
 (let ((?x250 (+ (+ (+ (+ (* b2x y1y) (* b2y v1x)) (* v1y y1x)) ?x973) ?x398)))
 (> (+ ?x250 ?x401) 0.0)))))))))
(assert
 (let ((?x246 (* (- 1.0) b2y)))
 (let ((?x398 (* ?x246 y1x)))
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x701 (* ?x461 b2x)))
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x223 (* ?x478 y1y)))
 (let ((?x121 (+ (+ (+ (+ (* b1x b2y) (* b1y y1x)) (* b2x y1y)) ?x223) ?x701)))
 (> (+ ?x121 ?x398) 0.0)))))))))
(assert
 (let ((?x478 (* (- 1.0) b1x)))
 (let ((?x242 (* ?x478 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x242) 0.0))))
(assert
 (let ((?x68 (* (- 1.0) b2x)))
 (let ((?x973 (* ?x68 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b2y)) (* b2y v1x)) ?x973) 0.0))))
(assert
 (let ((?x461 (* (- 1.0) b1y)))
 (let ((?x701 (* ?x461 b2x)))
 (> (+ (+ (+ b1y (* (- 1.0) b2y)) (* b1x b2y)) ?x701) 0.0))))
(assert
 (let ((?x461 (* (- 1.0) b1y)))
(let ((?x701 (* ?x461 b2x)))
(let ((?x478 (* (- 1.0) b1x)))
(let ((?x242 (* ?x478 v1y)))
(let ((?x54 (+ (+ (+ (+ (* b1x b2y) (* b1y v1x)) (* b2x v1y)) ?x242) ?x701)))
(> (+ ?x54 (* (* (- 1.0) b2y) v1x)) 0.0)))))))
(check-sat)
