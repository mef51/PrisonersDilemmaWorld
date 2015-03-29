console.log("hello");

// get cell1's payoff after playing with cell2
// T > R > P > S
var Payoffs = {
	"T": 3,
	"R": 2,
	"P": 1,
	"S": 0
};

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

var dilemmaGame = new terra.Terrarium(25, 25, {
	periodic: true,
	background: [22, 22, 22]
});

terra.registerCA({
	type: 'prisonersDilemma',
	colorFn: function () {
		return this.alive ? this.color + ',1' : '0,0,0,0'; },
	process: function (neighbors, x, y) {
		var surrounding = neighbors.filter(function (spot) {
			return spot.creature.alive;
		}).length;
		this.alive = surrounding === 3 || surrounding === 2 && this.alive;
		return true;
	}
}, function () {
	this.alive = Math.random() < 0.5;
});

dilemmaGame.grid = dilemmaGame.makeGrid('prisonersDilemma');
dilemmaGame.animate();
