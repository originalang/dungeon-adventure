if hp <= 0 {
	life -= 1;
	hp = 30;
}

if life == 0 {
	state = "death";
}