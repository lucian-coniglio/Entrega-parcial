import Semillas.*
import INTA.*

class Parcela {
	const property ancho
	const property largo
	const property horasAlSol
	const property plantas = []
	
	method esEcologica() = false
	method esIndustrial() = false
	method superficie() {return ancho * largo}
	method capacidadPlantas() {
		if(ancho > largo) {return self.superficie() / 5}
		else {return self.superficie() / 3 + largo}
	}
	method tieneComplicaciones() {return plantas.any({planta => planta.tiempoToleranciaSolar() < horasAlSol})}
	method plantar(planta) {
		if(plantas.size() < self.capacidadPlantas()
		and horasAlSol -2 >= planta.tiempoToleranciaSolar()
		) {plantas.add(planta)}
		else {self.error("La planta no puede ser agregada.")}
	}
	method porcentajeAsociadas() {
		return plantas.filter({planta => planta.seAsocia()}).size() * 100 / plantas.size()
	}
}

class EcoParcela inherits Parcela {
	override method esEcologica() = true
}

class InduParcela inherits Parcela {
	override method esIndustrial() = true
}












