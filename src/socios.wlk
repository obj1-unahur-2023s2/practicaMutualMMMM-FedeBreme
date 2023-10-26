import viajes.*
import gimnasio.*

//parte 4, Socios, agregar actividad

class Socios {
	const property actividadesQueRealizo = []
	const maximoDeActividades 
	const property edad
	const property idiomasQueHabla = []
	
	method esAdoradorDelSol() {
		return actividadesQueRealizo.all({a => a.sirveParaBroncearse()})
	}
	
	method actividadesEsforzadas() {
		return actividadesQueRealizo.filter({a => a.implicaEsfuerzo()})
	}
	
	method realizarActividad(unaActividad) {
		if (actividadesQueRealizo.size() >= maximoDeActividades) {
			self.error("No puede realizar mas actividades")
		} else {
			actividadesQueRealizo.add(unaActividad)
		}
	}
	
	method leAtraeLaActividad(unaActividad){//preguntar
		return true
	} 
}

//parte 5, Actividades que le atraen a cada socio 

class SocioTranquilo inherits Socios {
	
	override method leAtraeLaActividad(unaActividad) {
		return unaActividad.diasQueLlevaUnViaje() >= 4
	}
}

class SocioCoherente inherits Socios {
	
	override method leAtraeLaActividad(unaActividad) {
		if (self.esAdoradorDelSol()) {
			return unaActividad.sirveParaBroncearse()
		} else {
			return unaActividad.implicaEsfuerzo()
		}
	}
}

class SocioRelajado inherits Socios {
	
	override method leAtraeLaActividad(unaActividad) {
		return unaActividad.idiomas().any({a => idiomasQueHabla.contains({i => i == a})})
	}
}
