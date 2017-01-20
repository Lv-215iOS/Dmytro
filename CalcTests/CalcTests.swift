//
//  CalcTests.swift
//  CalcTests
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import XCTest
@testable import Calc

class CalcTests: XCTestCase {
    
    var brain : CalculatorBrain? = nil
    var result: Double? = nil
    
    override func setUp() {
        super.setUp()
        brain = CalculatorBrain()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        brain = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// 4 * 2 = 8
//    func test4Mul2() {
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 8)
//    }
//
//    /// 4 * 0.2 = 0.8
//    func test4Mul0dot2() {
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.8)
//    }
//    
//    /// 4.2 * 0.2 = 0.84
//    func test4Dot2Mul0dot2() {
//        brain?.digit(value: 4)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 2)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.84)
//    }
//    
//    /// 0.4 * 0.2 = 0.08
//    func test0dot4Mul0dot2() {
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.08)
//    }
//    
//    /// 4 * 5 * 5 = 100
//    func test4Mul5Mul5() {
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 100)
//    }
//    
//    /// 0.4 * 0.6 * 0.5 = 0.12
//    func test0Dot4Mul0Dot6Mul0Dot5() {
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 6)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.12)
//    }
//    
//    /// nan * 5 = nan
//    func testNanMul5() {
//        brain?.digit(value: .nan)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert((result?.isNaN)!)
//    }
//    
//    /// inf * 5 = inf
//    func testInfMul5() {
//        brain?.digit(value: .infinity)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert((result?.isInfinite)!)
//    }
//    
//    /// 4 * 5 * 5 * 5 = 600
//    func test4Mul5Mul5Mul5() {
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 6)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 600)
//    }
//    
//    /// 0.4 * 0.6 * 0.7 * 0.8 = 0.1344
//    func test0Dot4Mul0Dot6Mul0Dot7Mul0Dot8() {
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 6)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 7)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 8)
//        
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = Double(value!)
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.1344)
//    }
//    
//    /// 1 / (intMax + 10) * intMax = 1
//    func test1DivIntMaxMulIntMax() {
//        brain?.digit(value: 1)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: (Double(Int.max) + 10))
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: Double(Int.max) + 10)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 1)
//    }
//    
//    /// 1 / (intMin + 10) * intMin = 1
//    func test1DivIntMinMulIntMin() {
//        brain?.digit(value: 1)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: (Double(Int.min) + 10))
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: Double(Int.min) + 10)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 1)
//    }
//    
//    /// 10 * * 10 = 100
//    func test10MulMul10() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Mul)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 10)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 100)
//    }
//    
//    /// 10 * -10 = -100
//    func test10MulMinus10() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: -10)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -100)
//    }
//    
//    /// 10..10 * 10 = 101
//    func test10DotDot10Mul10() {
//        brain?.digit(value: 10)
//        brain?.utility(operation: .Dot)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 1)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 10)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 101)
//    }
//    
//    /// 10 * 6 = 60
//    func test10Mul6EqualEqual() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 6)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 60)
//    }
//    
//    /// 10 * 6 / 5 + 7 - 3 = 16
//    func test10Mul6Div5Plus7Minus3() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 6)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 7)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 3)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 16)
//    }
//    
//    /// 10 / 2 * 5 + 7 - 35 = -3
//    func test10Div2Mul5Plus7Minus30() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 2)
//        brain?.binary(operation: .Mul)
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 7)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 35)
//        var result: Double? = nil
//        brain?.result = { (value,error) ->() in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -3)
//    }
//    
//    //--------------------------------------------------------
//    
//    func testsqrt9() {
//        brain?.digit(value: 9)
//        brain?.unary(operation: .Sqrt)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 3)
//    }
//    
//    func testSin0() {
//        brain?.digit(value: 0)
//        brain?.unary(operation: .Sin)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0)
//        
//    }
//    
//    func testCos0() {
//        brain?.digit(value: 0)
//        brain?.unary(operation: .Cos)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 1)
//        
//    }
//    func testSin3pidiv2() {
//        brain?.digit(value: 4.71238898)
//        brain?.unary(operation: .Sin)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -1)
//        
//    }
//    
//    func testCospi() {
//        brain?.digit(value: 3.14159265)
//        brain?.unary(operation: .Cos)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -1)
//        
//    }
//    
//    func testSinpidiv2() {
//        brain?.digit(value: 1.57079632)
//        brain?.unary(operation: .Sin)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 1)
//        
//    }
//    
//    func testCospidiv2() {
//        brain?.digit(value: 1.57079632679)
//        brain?.unary(operation: .Cos)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! ~= 0)
//        
//    }
//    
//    
//    func testSinpidiv6() {
//        brain?.digit(value: 0.523598775598298873)
//        brain?.unary(operation: .Sin)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.5)
//        
//    }
//    
//    func testCospidiv3() {
//        brain?.digit(value: 1.04719755119)
//        brain?.unary(operation: .Cos)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! ~= 0.5)
//        
//    }
//    
//    func test10DivBy2() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = {(value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 5)
//    }
//    
//    func testNegative20DivByNegative5(){
//        
//        brain?.digit(value: -20)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: -5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 4)
//    }
//    
//    func testNegative6DivBy3(){
//        brain?.digit(value: -6)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 3)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -2)
//    }
//    
//    func test0DivBy5(){
//        brain?.digit(value: 0)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0)
//    }
//    
//    func test8DivByFraction(){
//        brain?.digit(value: 8)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 0.5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 16)
//    }
//    
//    func test5DivBy0() {
//        let infinity = Double.infinity
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 0)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == infinity)
//    }
//    
//    func testFractionDivByFraction() {
//        brain?.digit(value: 0.1)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 0.2)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.5)
//    }
//    
//    func testIntDivByIntLessThanIntMax() {
//        brain?.digit(value: 8)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 4)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! < Double(Int.max))
//    }
//    
//    func testIntDivByIntMoreThanIntMin() {
//        brain?.digit(value: 20)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 4)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! > Double(Int.min))
//    }
//    
//    func testNegative10DivByFraction() {
//        brain?.digit(value: -10)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 0.2)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -50)
//    }
//    
//    func testFractionDivBy5() {
//        brain?.digit(value: 0.1)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.02)
//    }
//    
//    func testFractionDivByNegative2() {
//        brain?.digit(value: 0.8)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: -2)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -0.4)
//    }
//    
//    func test5Plus4Equal9() {
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 4)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 9)
//    }
//    //test 2
//    func test5Plus4Plus2Equal11() {
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 4)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 11)
//    }
//    //test 3
//    func testNegative3Plus5Equal2(){
//        brain?.digit(value: 3)
//        brain?.unary(operation: .PlusMinus)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 2)
//    }
//    
//    //test 4
//    func test3PlusNegative5EqualNegative2(){
//        brain?.digit(value: 3)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == -2)
//    }
//    //test 5
//    func testNegative3PlusNegative5EqualNegative8(){
//        brain?.digit(value: 3)
//        brain?.unary(operation: .PlusMinus)
//        
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == -8)
//    }
//    
//    //test 6
//    func testNegative4Plus6PlusNegative5EqualNegative3() {
//        brain?.digit(value: 4)
//        brain?.unary(operation: .PlusMinus)
//        
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 6)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == -3)
//    }
//    //test 7
//    func testFractionPlusFraction() {
//        brain?.digit(value: 0.1)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 0.2)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.3)
//    }
//    
//    //test 8
//    func testNegativeFractionPlus8() {
//        brain?.digit(value: 0.5)
//        brain?.unary(operation: .PlusMinus)
//        
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 8)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 7.5)
//    }
//    
//    //test 9
//    func testFractionPlusFractionPlusNegativeFraction() {
//        brain?.digit(value: 0.5)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 0.2)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 0.6)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.1)
//    }
//    
//    //test 10
//    
//    func test6Plus4EqualEqual14() {
//        brain?.digit(value: 6)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 4)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 14)
//    }
//    //test 11
//    func testNegative5plusNegative2EqualEqual() {
//        brain?.digit(value: 5)
//        brain?.unary(operation: .PlusMinus)
//        
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 2)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == -9)
//    }
//    //test 12
//    func testFractionPlusNegative5EqualEqual() {
//        brain?.digit(value: 0.2)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        brain?.unary(operation: .PlusMinus)
//        
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == -9.8)
//    }
//    
//    //test 13
//    func test9SqrtPlus5Equals8() {
//        brain?.digit(value: 9)
//        brain?.unary(operation: .Sqrt)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 8)
//    }
//    
//    //test 14
//    func test9SqrtPlus9SqrtEquals6() {
//        brain?.digit(value: 9)
//        brain?.unary(operation: .Sqrt)
//        brain?.binary(operation: .Plus)
//        brain?.digit(value: 9)
//        brain?.unary(operation: .Sqrt)
//        
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        
//        XCTAssert(result == 6)
//    }
//    
//    //1) 7 - 4 = 3
//    func test7Min4Equal3() {
//        brain?.digit(value: 7)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 4)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 3)
//    }
//    //2) 15-3-2=10
//    func test15Min3Min2Equal10() {
//        brain?.digit(value: 15)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 3)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 2)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 10)
//    }
//    //3) 2-3.5=-1.5
//    func test2Min3dot5Equalminus1dot5() {
//        brain?.digit(value: 2)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 3.5)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -1.5)
//    }
//    //4) 5-11=-6
//    func test5Min11Equalminus6() {
//        brain?.digit(value: 5)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 11)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -6)
//    }
//    //5) 3.56-1.75=1.81
//    func test3dot55Min1dot75Equal1dot8() {
//        brain?.digit(value: 3.56)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 1.75)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 1.81)
//    }
//    //6) 9-0=9
//    func test9Min0Equal9() {
//        brain?.digit(value: 9)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 0)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 9)
//    }
//    //7) -10-0.5=-10.5
//    func testminus10Min0dot5Equalminus10dot5() {
//        brain?.digit(value: -10)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 0.5)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -10.5)
//    }
//    //8) -5-(-3)=-2
//    func testminus5Minminus3Equalminus2() {
//        brain?.digit(value: -5)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: -3)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -2)
//    }
//    //9) 3-4.5-(-2)=0.5
//    func test3Min4dot5Minminus2Equal0dot5() {
//        brain?.digit(value: 3)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 4.5)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: -2)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.5)
//    }
//    //10) 0-1=-1
//    func test0Min1Equalminus1() {
//        brain?.digit(value: 0)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 1)
//        var result: Double? = nil
//        brain?.result = {(value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == -1)
//    }
//    //11 Int Minus less than intMax
//    func testIntMinLessThanIntMax() {
//        brain?.digit(value: 8)
//        brain?.binary(operation: .Div)
//        brain?.digit(value: 6)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! < Double(Int.max))
//    }
//    //12 Int Minus more than intMin
//    func testIntMinMoreThanIntMin() {
//        brain?.digit(value: 10)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: 5)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result! > Double(Int.min))
//    }
//    //13 -4-(-7)-(-3)=6
//    func testminus4Minminus7Minminus3Equal6() {
//        brain?.digit(value: -4)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: -7)
//        brain?.binary(operation: .Minus)
//        brain?.digit(value: -3)
//        var result: Double? = nil
//        brain?.result = { (value,error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 6)
//    }
//    
//    func testSqrt25() {
//        brain?.digit(value: 25)
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 5)
//        
//    }
//    
//    func testSqrtNegative25() {
//        brain?.digit(value: 25)
//        brain?.unary(operation: .changeSign)
//        brain?.utility(operation: .Equal)
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result!.isNaN)
//    }
//    
//    func testSqrtMaxInt () {
//        brain?.digit(value: Double(INT_MAX))
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == sqrt(Double(INT_MAX)))
//    }
//    func testSqrtMinInt () {
//        brain?.digit(value: Double(INT_MAX))
//        brain?.unary(operation: .changeSign)
//        brain?.utility(operation: .Equal)
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result!.isNaN)
//    }
//    
//    func testSqrtO () {
//        brain?.digit(value: 0)
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0)
//        
//    }
//    
//    func testSqrt0point25 () {
//        brain?.digit(value: 0)
//        brain?.utility(operation: .Dot)
//        brain?.digit(value: 25)
//        brain?.unary(operation: .sqrt)
//        var result: Double? = nil
//        brain?.result = { (value, error) in
//            result = value
//        }
//        brain?.utility(operation: .Equal)
//        XCTAssert(result == 0.5)
//        
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
