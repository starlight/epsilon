(define-library
  (epsilon tests)
  (import
    scheme
    r7rs
    test
    (epsilon tests fixture))

  (begin
    (test-group
      "compile"
      (test
        "#t"
        (test-compile #t)))
    (test-exit)))
