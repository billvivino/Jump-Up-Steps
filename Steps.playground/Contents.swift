import UIKit

//Someone can jump up the stairs jumping by 1, 2, or 3 stairs each time.  For a given n number of stairs, how many different ways can this person
//jump up the stairs?

//memoized solution

func solution(_ n: Int) -> Int {
    print("Someone can jump up the stairs jumping by 1, 2, or 3 stairs each time.  For a given n number of stairs, how many different ways can this person jump up the stairs?")
    var numberOfPaths = 0
    var memo: [Int:Int] = [:]
    let stairsLeft = n
    for jump in 1...3 {
        if stairsLeft - jump > 0 {
            if memo[stairsLeft - jump] != nil {
                numberOfPaths += memo[stairsLeft - jump]!
            } else {
                numberOfPaths += numberOfDifferentJumpCombos(stairsLeft - jump, &memo)
                memo[stairsLeft - jump] = numberOfPaths
            }
        } else if stairsLeft - jump == 0 {
            numberOfPaths += 1
            //                memo[jump] = numberOfPaths
        }
    }
    
    return numberOfPaths
}

func numberOfDifferentJumpCombos(_ stairsLeft: Int, _ memo: inout [Int:Int]) -> Int {
    var numberOfPaths = 0
    
    for jump in 1...3 {
        if stairsLeft - jump == 0 {
            numberOfPaths += 1
            memo[stairsLeft - jump] = numberOfPaths
        } else if stairsLeft - jump > 0 {
            if memo[stairsLeft - jump] != nil {
                numberOfPaths += memo[stairsLeft - jump]!
            } else {
                numberOfPaths += numberOfDifferentJumpCombos(stairsLeft-jump, &memo)
                memo[stairsLeft - jump] = numberOfPaths
            }
        }
    }
        
    return numberOfPaths
}

//Input:
let n = 3
//Expected Output: 4
print("n = 3")
print(solution(3))

//n = 4
//7
print("n = 4")
print(solution(4))

//n = 5
//13
print("n = 5")
print(solution(5))

//n = 8
//81
print("n = 8")
print(solution(8))

//n = 10
//274
print("n = 10")
print(solution(10))

//n = 20
//121415
print("n = 20")
print(solution(20))

//n = 30
print("n = 30")
print(solution(30))

print("n = 50")
print(solution(50))












