(define-library
  (epsilon tests)
  (import
    scheme
    r7rs
    test
    (epsilon base))

  (begin
    (test-group
      "compile-string"
      (test
        "BEL char returned by `compile-string`"
        "\a"
        (compile-string '())))

    (test-exit)))
