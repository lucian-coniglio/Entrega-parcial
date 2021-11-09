import Semillas.*
import Parcelas.*

object inta {
	const property parcelas = []
	
	method promedioPlantas() {return parcelas.sum({parcela => parcela.plantas().size()}) / parcelas.size()}
	method parcelaMasAutosostenible() {
		return parcelas.filter({parcela => parcela.plantas().size() > 4}).max({parcela => parcela.porcentajeAsociadas()})
	}
}
