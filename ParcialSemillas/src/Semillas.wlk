import Parcelas.*
import INTA.*

class Semilla {
	const property fechaObt
	const property altura
	
	method esIdeal(parcela)
	method tiempoToleranciaSolar() {return 0}
	method esFuerte() {return self.tiempoToleranciaSolar() > 10}
	method daSemillas() {return self.esFuerte()}
	method espacioOcupado() {return 0}
	method seAsocia(parcela) {
		if(parcela.esEcologica() and not parcela.esIndustrial())
		{return (not parcela.tieneComplicaciones()) and self.esIdeal(parcela)}
		else if(parcela.esIndustrial() and not parcela.esEcologica())
		{return parcela.plantas().size() -2 >= parcela.capacidadPlantas() and self.esFuerte()}
		else {return false}
	}
}

class Menta inherits Semilla {
	override method tiempoToleranciaSolar() {return 6}
	override method daSemillas() {return super() or altura > 0.4}
	override method espacioOcupado() {return altura * 3}
	override method esIdeal(parcela) {
		return parcela.superficie() > 6
	}
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() {return super() * 2}
}

class Soja inherits Semilla {
	override method tiempoToleranciaSolar() {
		if(altura < 0.5) {return 6}
		else if(altura > 1) {return 9}
		else {return 7}
	}
	override method daSemillas() {return super() or (fechaObt > 2007 and altura > 1)}
	override method espacioOcupado() {return altura / 2}
	override method esIdeal(parcela) {return self.tiempoToleranciaSolar() == parcela.horasAlSol()}
}

class SojaTransgenica inherits Soja {
	override method daSemillas() {return false}
	override method esIdeal(parcela) {return parcela.capacidadPlantas() == 1}
}

class Quinoa inherits Semilla {
	const property tiempoToleranciaSolar
	
	override method tiempoToleranciaSolar() {return tiempoToleranciaSolar}
	override method daSemillas() {return super() or fechaObt < 2005}
	override method espacioOcupado() {return 0.5}
	override method esIdeal(parcela) {
		return parcela.plantas().all({planta => planta.altura() <= 1.5})
	}
}








