
object nave {
    const property pasajeros = [neo,morfeo,triniti]
    method subirALaNave(unPasajero) {
        if(self.estaEnLaNave(unPasajero)) {
            self.error("el pasajero ya está en la nave")
        }
        pasajeros.add(unPasajero)
    }
    method bajarseDeLaNave(unPasajero) {
        if(!self.estaEnLaNave(unPasajero)) {
            self.error("el pasajero no está en la nave")
        }
        pasajeros.remove(unPasajero)
    }
    method estaEnLaNave(unPasajero) {
        return pasajeros.contains(unPasajero)
    }
    method cantidadDePasajeros() {
        return pasajeros.size()
    }
    method pasajeroDeMayorVitalidad() {
        return pasajeros.max({p => p.vitalidad()})
    }
    method pasajeroDeMenorVitalidad() {
        return pasajeros.min({p => p.vitalidad()})
    }
    method estaElElegido() {
        return pasajeros.any({p => p.esElElegido()})
    }
    method saltan(unaLista) {
        unaLista.forEach({p => p.saltar()})
    }
    method chocar() {
        pasajeros.forEach({
            p => p.saltar()
                 p.bajarseDeLaNave()
        })
    }
    method chocarFacil() {
        self.saltan(pasajeros)
        pasajeros.clear()
    }
    method removerAlgunos(unaLista) {
        pasajeros.removeAll(unaLista)
    }
    method estaEquilibrada() {
        return 
        self.pasajeroDeMayorVitalidad().vitalidad() 
        <= self.pasajeroDeMenorVitalidad().vitalidad() * 2
    }
    method acelerar() {
        self.saltan(self.noElegidos())
    }
    method noElegidos() {
        return pasajeros.filter({
            p => !p.esElElegido()
        })
    }
    method vitalidadesDePasajeros() {
        return 
        pasajeros.map({
            p=> p.vitalidad()
        })
    }
    method ordenarDeMenorVitalidadAMayor() {
        pasajeros.sortBy({
            p1,p2 =>
            p1.vitalidad() < p2.vitalidad()
        })
    }
    method listaDeVitalidades() {
        return pasajeros.map({p=>p.vitalidad()})
    }
    method cualquierPasajero() {
        return pasajeros.anyOne()
    }
    method cantidadDeElegidosEnLaNave() {
        return pasajeros.count({p=>p.esElElegido()})
    }
}

object neo {
    var energia = 100
    method esElElegido() {
        return true
    }
    method saltar() {
        energia = energia * 0.5
    }
    method vitalidad() {
        return energia * 0.1
    }
    method subirseALaNave() {
        nave.subirALaNave(self)
    }
    method bajarseDeLaNave() {
        nave.bajarseDeLaNave(self)
    }
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false
    method esElElegido() {
        return false
    }
    method saltar() {
        estaCansado = not estaCansado
        vitalidad = 0.max(vitalidad - 1)
    }
    method vitalidad() {
        return vitalidad
    }
    method subirseALaNave() {
        nave.subirALaNave(self)
    }
    method bajarseDeLaNave() {
        nave.bajarseDeLaNave(self)
    }
}

object triniti {
    method vitalidad() {
        return 0
    }
    method esElElegido() {
        return false
    }
    method saltar() {
        //no hace nada
    }
    method subirseALaNave() {
        nave.subirALaNave(self)
    }
    method bajarseDeLaNave() {
        nave.bajarseDeLaNave(self)
    }
}