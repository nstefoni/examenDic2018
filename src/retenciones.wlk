object retencion {

	const ley19032 = 0.03
	const obraSocial = 0.03
	const jubilacion = 0.11

	// Me devuelve el sueldo con retenciones aplicadas y impGcias si corresponde
	method aplicar(empleado) {
		var sueldoConDescuentos = empleado.sueldoBruto() * (ley19032 + obraSocial + jubilacion) / 100
		if(empleado.estaAfiliado()){
			sueldoConDescuentos = sueldoConDescuentos - (sueldoConDescuentos * 1 / 100)
		}
		return sueldoConDescuentos - self.impGanancias(empleado.sueldoBruto())
	}

	method impGanancias(sueldoBruto) {
		if (sueldoBruto > 30000) {
			return sueldoBruto - (sueldoBruto - (30000)) * 0.02
		}
		return 0
	}

}

