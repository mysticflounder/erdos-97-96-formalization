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
(declare-fun a1y () Real)
(declare-fun a1x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x90 (* (- 1.0) v1x)))
 (let ((?x563 (* (- 1.0) R2)))
 (let ((?x98 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x563)))
 (= (+ (+ ?x98 ?x90) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x15 (* (- 1.0) rho2)))
 (let ((?x701 (* xy xy)))
 (let ((?x55 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x701) ?x15)))
 (= (+ (+ ?x55 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x15 (* (- 1.0) rho2)))
 (let ((?x481 (* y1y y1y)))
 (let ((?x63 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x481) ?x15)))
 (= (+ (+ ?x63 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x15 (* (- 1.0) rho2)))
 (let ((?x701 (* xy xy)))
 (let ((?x42 (+ (+ (+ (+ (* a1x a1x) (* a1y a1y)) (* xx xx)) ?x701) ?x15)))
 (= (+ (+ ?x42 (* (* (- 2.0) a1x) xx)) (* (* (- 2.0) a1y) xy)) 0.0)))))
(assert
 (let ((?x15 (* (- 1.0) rho2)))
 (let ((?x701 (* xy xy)))
 (let ((?x150 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x701) ?x15)))
 (= (+ (+ ?x150 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x147 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x147 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x296 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x296 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x620 (* oy oy)))
 (let ((?x285 (* (- 1.0) ?x620)))
 (let ((?x205 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) a1x) (* (- 1.0) (* a1x a1x))) (* (- 1.0) (* a1y a1y)))))
 (>= (+ (+ ?x205 ?x285) (* (* 2.0 a1y) oy)) 0.0)))))
(assert
 (let ((?x620 (* oy oy)))
 (let ((?x285 (* (- 1.0) ?x620)))
 (let ((?x151 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x151 ?x285) (* (* 2.0 b1y) oy)) 0.0)))))
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
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x437 (* ?x224 xy)))
 (> ?x437 0.0))))
(assert
 (let ((?x306 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x306 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x340 (* ?x224 y1y)))
 (> ?x340 0.0))))
(assert
 (let ((?x16 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x16 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x401 (* a1y v1y)))
 (> ?x401 0.0)))
(assert
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x217 (* ?x424 v1x)))
 (let ((?x74 (* ?x217 v1y)))
 (let ((?x401 (* a1y v1y)))
 (let ((?x412 (+ (+ (+ (* (- 1.0) (* v1y v1y)) (* a1x (* v1y v1y))) ?x401) ?x74)))
 (> ?x412 0.0)))))))
(assert
 (> (+ (* a1x (* v1y v1y)) (* (* (* (- 1.0) a1y) v1x) v1y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x88 (* b1y v1x)))
 (let ((?x353 (* ?x88 v1y)))
 (let ((?x355 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x355 ?x353) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (let ((?x46 (* (- 1.0) y1y)))
 (> ?x46 0.0)))
(assert
 (> (+ (* a1y y1x) (* (* (- 1.0) a1x) y1y)) 0.0))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (let ((?x265 (* (- 1.0) xy)))
 (> ?x265 0.0)))
(assert
 (> (+ (* a1y xx) (* (* (- 1.0) a1x) xy)) 0.0))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (> a1y 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* a1x v1y) (* (* (- 1.0) a1y) v1x)) 0.0))
(assert
 (> (+ (* a1x b1y) (* (* (- 1.0) a1y) b1x)) 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x417 (* (- 1.0) xx)))
 (let ((?x237 (* ?x417 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x237) 0.0))))
(assert
 (let ((?x417 (* (- 1.0) xx)))
 (let ((?x237 (* ?x417 y1y)))
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x51 (* ?x424 y1x)))
 (let ((?x200 (* (- 1.0) a1x)))
 (let ((?x149 (* ?x200 xy)))
 (let ((?x221 (+ (+ (+ (+ (* a1x y1y) (* a1y xx)) (* xy y1x)) ?x149) ?x51)))
 (> (+ ?x221 ?x237) 0.0)))))))))
(assert
 (let ((?x417 (* (- 1.0) xx)))
 (let ((?x237 (* ?x417 y1y)))
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x137 (* ?x224 y1x)))
 (let ((?x90 (* (- 1.0) v1x)))
 (let ((?x391 (* ?x90 xy)))
 (let ((?x464 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x391) ?x137)))
 (> (+ ?x464 ?x237) 0.0)))))))))
(assert
 (let ((?x417 (* (- 1.0) xx)))
 (let ((?x237 (* ?x417 y1y)))
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x76 y1x)))
 (let ((?x111 (* (- 1.0) b1x)))
 (let ((?x186 (* ?x111 xy)))
 (let ((?x329 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x186) ?x445)))
 (> (+ ?x329 ?x237) 0.0)))))))))
(assert
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x51 (* ?x424 y1x)))
 (> (+ (+ (+ a1y (* (- 1.0) y1y)) (* a1x y1y)) ?x51) 0.0))))
(assert
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x137 (* ?x224 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x137) 0.0))))
(assert
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x76 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x445) 0.0))))
(assert
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x137 (* ?x224 y1x)))
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x217 (* ?x424 v1x)))
 (let ((?x200 (* (- 1.0) a1x)))
 (let ((?x235 (* ?x200 y1y)))
 (let ((?x379 (+ (+ (+ (+ (* a1x v1y) (* a1y y1x)) (* v1x y1y)) ?x235) ?x217)))
 (> (+ ?x379 ?x137) 0.0)))))))))
(assert
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x76 y1x)))
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x305 (* ?x424 b1x)))
 (let ((?x200 (* (- 1.0) a1x)))
 (let ((?x235 (* ?x200 y1y)))
 (let ((?x275 (+ (+ (+ (+ (* a1x b1y) (* a1y y1x)) (* b1x y1y)) ?x235) ?x305)))
 (> (+ ?x275 ?x445) 0.0)))))))))
(assert
 (let ((?x90 (* (- 1.0) v1x)))
 (let ((?x352 (* ?x90 y1y)))
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x445 (* ?x76 y1x)))
 (let ((?x111 (* (- 1.0) b1x)))
 (let ((?x57 (* ?x111 v1y)))
 (let ((?x469 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x57) ?x445)))
 (> (+ ?x469 ?x352) 0.0)))))))))
(assert
 (let ((?x407 (+ (+ (+ a1y (* (- 1.0) xy)) (* a1x xy)) (* (* (- 1.0) a1y) xx))))
 (> ?x407 0.0)))
(assert
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x136 (* ?x224 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x136) 0.0))))
(assert
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x358 (* ?x76 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x358) 0.0))))
(assert
 (let ((?x224 (* (- 1.0) v1y)))
 (let ((?x136 (* ?x224 xx)))
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x217 (* ?x424 v1x)))
 (let ((?x200 (* (- 1.0) a1x)))
 (let ((?x149 (* ?x200 xy)))
 (let ((?x30 (+ (+ (+ (+ (* a1x v1y) (* a1y xx)) (* v1x xy)) ?x149) ?x217)))
 (> (+ ?x30 ?x136) 0.0)))))))))
(assert
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x358 (* ?x76 xx)))
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x305 (* ?x424 b1x)))
 (let ((?x200 (* (- 1.0) a1x)))
 (let ((?x149 (* ?x200 xy)))
 (let ((?x252 (+ (+ (+ (+ (* a1x b1y) (* a1y xx)) (* b1x xy)) ?x149) ?x305)))
 (> (+ ?x252 ?x358) 0.0)))))))))
(assert
 (let ((?x90 (* (- 1.0) v1x)))
 (let ((?x391 (* ?x90 xy)))
 (let ((?x76 (* (- 1.0) b1y)))
 (let ((?x358 (* ?x76 xx)))
 (let ((?x111 (* (- 1.0) b1x)))
 (let ((?x57 (* ?x111 v1y)))
 (let ((?x482 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x57) ?x358)))
 (> (+ ?x482 ?x391) 0.0)))))))))
(assert
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x217 (* ?x424 v1x)))
 (> (+ (+ (+ a1y (* (- 1.0) v1y)) (* a1x v1y)) ?x217) 0.0))))
(assert
 (let ((?x424 (* (- 1.0) a1y)))
 (let ((?x305 (* ?x424 b1x)))
 (> (+ (+ (+ a1y (* (- 1.0) b1y)) (* a1x b1y)) ?x305) 0.0))))
(assert
 (let ((?x111 (* (- 1.0) b1x)))
 (let ((?x57 (* ?x111 v1y)))
 (> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x57) 0.0))))
(assert
 (let ((?x111 (* (- 1.0) b1x)))
(let ((?x57 (* ?x111 v1y)))
(let ((?x424 (* (- 1.0) a1y)))
(let ((?x217 (* ?x424 v1x)))
(let ((?x45 (+ (+ (+ (* a1x v1y) (* a1y b1x)) (* b1y v1x)) (* (* (- 1.0) a1x) b1y))))
(> (+ (+ ?x45 ?x217) ?x57) 0.0)))))))
(check-sat)
