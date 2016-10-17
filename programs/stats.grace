dialect "minitest"

method min(a, b, c) {
    //returns the minimum value of a b and c.    
    //examples:
    //min(1,2,3) should be 1
    //min(2,1,3) should be 1
    //min(2,2,2) should be 2
    
    //This seems really hard, and I don't know how to take the minimum of 3 numbers,
    //but I do know how to take the minimum of 2 numbers,
    //and I know that the minimum of a,b,c is the minimum of a and the minimum of b and c
    //let's do that instead
    return min2(a, min2(b,c))
}

method min2(a,b) {
    //finds the smallest (minimum) of two numbers
    //examples:
    //min2(0,1) should be 0
    //min2(1,0) should be 0
    //min2(1,1) should be 1
    if(a ≤ b) then {return a}
    return b
}


method max(a, b, c) {
    //returns the maximum value of a b and c.
    //examples:
    //max(1,2,3) should be 3
    //max(2,1,3) should be 3
    //max(2,2,2) should be 2
    
    //wait this sounds really similar to min.
    //I wonder if we can use that.
    //well if a ≥ b then -a ≤ -b,
    //so if we negate the number then the largest number
    //will suddently be the smallest number.
    return -min(-a,-b,-c)
}

method median(a,b,c) {
    //return the value that is between the minimum and the maximum
    //examples:
    //median(1,2,3) should be 2
    //median(2,2,3) should be 2
    //median(1,1,2) should be 1
    //median(3,1,2) should be 2
    
    //we know that min(a,b,c) is the smallest number and
    //max(a,b,c) is the largest number, so the median must be the other number.
    return a + b + c - (min(a,b,c) + max(a,b,c))
}


testSuite {
    test "min" by {
        assert (min(1,2,3)) shouldBe 1
        assert (min(2,1,3)) shouldBe 1
        assert (min(2,2,2)) shouldBe 2
    }
    
    test "min2" by {
        assert (min2(0,1)) shouldBe 0
        assert (min2(1,0)) shouldBe 0
        assert (min2(1,1)) shouldBe 1
    }
    
    test "max" by {
        assert (max(1,2,3)) shouldBe 3
        assert (max(2,1,3)) shouldBe 3
        assert (max(2,2,2)) shouldBe 2
    }
    
    test "median" by {
        assert (median(1,2,3)) shouldBe 2
        assert (median(2,2,3)) shouldBe 2
        assert (median(1,1,2)) shouldBe 1
        assert (median(3,1,2)) shouldBe 2
    }
}