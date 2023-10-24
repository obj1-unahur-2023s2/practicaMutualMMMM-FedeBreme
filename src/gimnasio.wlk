import viajes.*
import socios.*

//parte 3, Clases de gimnasia

class ClasesDeGimnasia inherits Viajes {
	
	override method diasQueLlevaUnViaje() = 1
	
	override method sirveParaBroncearse() = false
	
	override method implicaEsfuerzo() = true
	
	override method esRecomendadaPara(unSocio) {
		return unSocio.edad().between(20, 30)
	}
}
