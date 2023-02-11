(define-library
  (epsilon tests)
  (import
    scheme
    r7rs
    test
    (epsilon tests fixture))

  (begin
    (test-group
      "test-compile"
      (test
        "parses s-expressions"
        "(quote ())"
        (test-compile "'()")))
    (test-exit)))
