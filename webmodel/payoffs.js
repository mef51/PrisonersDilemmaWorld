// get cell1's payoff after playing with cell2

// T > R > P > S
var Payoffs = {
    "T": 3,
    "R": 2,
    "P": 1,
    "S": 0
}
function payoff(cell1, cell2) {
    if(cell1 == "C" && cell2 == "D"){
        return S;
    }
    if(cell1 == "C" && cell2 == "C"){
        return R;
    }
    if(cell1 == "D" && cell2 == "D"){
        return P;
    }
    if(cell1 == "D" && cell2 == "C"){
        return T;
    }
}