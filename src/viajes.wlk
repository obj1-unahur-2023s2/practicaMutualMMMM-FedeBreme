import socios.*

//parte 1, Viajes

class Viajes {
	const property idiomas = []
	
	method sumarIdiomas(nuevosIdiomas) {
		idiomas.addAll(nuevosIdiomas)
	}
	
	method quitarIdioma(unIdioma) {
		idiomas.remove(unIdioma)
	}
	
	method diasQueLlevaUnViaje()
	
	method sirveParaBroncearse()
	
	method implicaEsfuerzo()
	
	method esViajeInteresante() {
		return idiomas.size() > 1
	}
	
	method esRecomendadaPara(unSocio) {
		return self.esViajeInteresante() and unSocio.leAtraeLaActividad(self) 
		and unSocio.actividadesQueRealizo().any({a => a == self})
	}
}

class ViajesDePlaya inherits Viajes {
	const largoDePlaya
	
	override method diasQueLlevaUnViaje() {
		return largoDePlaya / 500
	}
	
	override method implicaEsfuerzo() {
		return largoDePlaya > 1200
	}
	
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viajes {
	var property cantDeAtracciones
	
	override method diasQueLlevaUnViaje() {
		return cantDeAtracciones / 2
	}
	
	override method implicaEsfuerzo() {
		return cantDeAtracciones.between(5, 8)
	}
	
	override method sirveParaBroncearse() = false
	
	override method esViajeInteresante() {
		return super() or cantDeAtracciones == 5
	}
} 

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method cantDeAtracciones() {
		return = cantDeAtracciones += 1
	}
	
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viajes{
	const kilometrosDeSendero
	const diasDeSolPorAnio
	
	override method diasQueLlevaUnViaje() {
		return kilometrosDeSendero / 50
	}
	
	override method implicaEsfuerzo() {
		return kilometrosDeSendero > 80
	}
	
	override method sirveParaBroncearse() {
		return diasDeSolPorAnio > 200 or diasDeSolPorAnio.between(100, 200) and kilometrosDeSendero > 120
	}
	
	override method esViajeInteresante() {
		return super() or diasDeSolPorAnio > 140
	}
}
